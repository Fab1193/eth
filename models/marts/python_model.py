import holidays

from snowflake.snowpark.functions import col, udf
from snowflake.snowpark.types import BooleanType, DateType


def model(dbt, session):

    dbt.config(
        materialized="table",
        python_version="3.10",
        packages=["holidays"]
    )

    @udf(
        return_type=BooleanType(),
        input_types=[DateType()],
        runtime_version="3.10",
        packages=["holidays"]
    )
    def is_holiday_udf(date_col):
        french_holidays = holidays.France()
        return date_col in french_holidays

    df = dbt.ref("stablecoin_activity_per_day")

    df = df.with_column(
        "IS_HOLIDAY",
        is_holiday_udf(col("DATE"))
    )

    return df