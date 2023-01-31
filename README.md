## Usage

```sh
docker pull ppcelery/protoc-gen-doc:latest

docker run --rm \
        -v $(pwd):/out \
        -v $(pwd)/protocol:/protos \
        ppcelery/protoc-gen-doc:latest --doc_opt=markdown,api.md --proto_path=/protos \
            coordinator/v1/api.proto \
            join/v1/api.proto \
            kms/v2alpha1/api.proto \
            pki/v1/api.proto \
            common/v1/pki.proto \
            common/v1/ra.proto
```

## Bug fix

- [Support multi line description in markdown](https://github.com/Laisky/protoc-gen-doc/pull/1)
