# --java_out output;   --proto_path dir in which search imports.
protoc ../../main/proto/*.proto --java_out=../../main/proto --proto_path=../../main/proto/ --proto_path=../../../../nebula-core/src/main/proto/
