export GOPATH=~/.local/share/gopath
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/

RUBY_GEM_BIN=~/.gem/ruby/2.3.0/bin
LOCAL_BIN=~/.local/bin
CARGO_STABLE_BIN=~/.multirust/toolchains/stable/cargo/bin
CARGO_BIN=~/.cargo/bin
GOPATH_BIN=$GOPATH/bin

export PATH=$PATH:$RUBY_GEM_BIN:$LOCAL_BIN:$CARGO_STABLE_BIN:$CARGO_BIN:$GOPATH_BIN
