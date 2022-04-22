from datetime import datetime

from influxdb_client import InfluxDBClient, Point, WritePrecision
from influxdb_client.client.write_api import SYNCHRONOUS

# You can generate an API token from the "API Tokens Tab" in the UI
token = "p7wcUGxFm2N4MoiV5R4oA3Fr7jjqR7K5eG7X9TgnzxXfhXz9ohljRv-v-CV4OWFk3oRGnTvGiEMvHWX10arorg=="
org = "my-org"
bucket = "nonebu"

with InfluxDBClient(url="http://192.168.1.50:8086", token=token, org=org) as client:
  write_api = client.write_api(write_options=SYNCHRONOUS)

  data = "mem,host=host1 used_percent=23.43234543"
  write_api.write(bucket, org, data)
