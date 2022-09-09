import boto3
import pandas as pd

# criar cliente para interagir com AWS S3

access_key = "AKIAZVY46D5S56W6QEPO"
secret_access = "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"

s3_client = boto3.client("s3",aws_access_key_id=access_key,aws_secret_access_key=secret_access)

s3_client.download_file("datalake-eric-igti-edc",
                        "data/exportar_atendimentos.csv",
                        "c:/data/exportar_atendimentos.csv"
                        )

df = pd.read_csv('c:/data/exportar_atendimentos.csv', sep=',')
print(df)

s3_client.upload_file("c:/data/teste.csv",
                      "datalake-eric-igti-edc",
                      "data/teste.csv")