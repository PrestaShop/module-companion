#!./libs/bats/bin/bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

assert_exists() {
  assert [ -f "$1" ]
}

scripts="./scripts"
move_module="$scripts/move_module"
clone="$scripts/clone"
install_webserver="$scripts/install_webserver"
install="$scripts/install"
install_module="$scripts/install_module"

setup() {
  export TMP_DIRECTORY="$(mktemp -d)"
}

teardown() {
  if [ $BATS_TEST_COMPLETED ]; then
    rm -rf $TMP_DIRECTORY
  else
    echo "** Did not delete $TMP_DIRECTORY, as test failed **"
  fi
}

@test "PrestaShop cloning should works" {
    run $clone $TMP_DIRECTORY 1.7.4.x

    assert_success
    assert_exists "$TMP_DIRECTORY/README.md"
    assert_exists "$TMP_DIRECTORY/composer.json"
}

@test "PrestaShop installation should works" {
    git clone https://github.com/PrestaShop/PrestaShop $TMP_DIRECTORY
    run $install $TMP_DIRECTORY

    assert_success
    assert_exists "$TMP_DIRECTORY/vendor/autoload.php"
}