# This file contains user-specific environment variables that I wish to share
# with both Bash and ZSH

# Go
export GOPATH=$HOME/repos/go

# CA Certs (pip, among others)
if [ -f $HOME/.cacert.pem ]; then
  export CAFILE=$HOME/.cacert.pem
  # OpenSSL
  export SSL_CERT_FILE=$CAFILE
  # Python
  export REQUESTS_CA_BUNDLE=$CAFILE
  # Python - httplib2, GCP SDK
  export HTTP2LIB_CA_CERTS=$CAFILE
  # AWS
  export AWS_CA_BUNDLE=$CAFILE
fi
