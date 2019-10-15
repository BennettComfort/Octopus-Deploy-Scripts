#!/bin/bash
while IFS=" " read -r value1 value2 remainder
do
	dotnet-octo deploy-release --project=$value1 --releaseNumber=$value2 --deployto=<ENVIRONMENT> --progress --server=<SERVER> --apiKey=<API-KEY>

done < $1