class LibcbliteAT324 < Formula
  desc "Couchbase Lite C and C++ libraries (Enterprise Edition)"
  homepage "https://docs.couchbase.com/couchbase-lite/current/"
  url "https://packages.couchbase.com/releases/couchbase-lite-c/3.2.4/couchbase-lite-c-enterprise-3.2.4-macos.zip"
  sha256 "86b417b4ed16d9930e8b2603f543e05b5233d8e7ab0c0020a76257f0b7db3f31"
  license :cannot_represent

  keg_only :versioned_formula

  def install
    include.install Dir["include/*"]
    lib.install "lib/libcblite.#{version}.dylib"
    (lib/"cmake").install "lib/cmake/CouchbaseLite"
    lib.install_symlink "libcblite.#{version}.dylib" => "libcblite.#{version.major}.dylib"
    lib.install_symlink "libcblite.#{version.major}.dylib" => "libcblite.dylib"
  end
end
