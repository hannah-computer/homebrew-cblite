class LibcbliteAT31 < Formula
  desc "Couchbase Lite C and C++ libraries (Enterprise Edition)"
  homepage "https://docs.couchbase.com/couchbase-lite/current/"
  url "https://packages.couchbase.com/releases/couchbase-lite-c/3.1.10/couchbase-lite-c-enterprise-3.1.10-macos.zip"
  sha256 "f7d65c47a72e0d46ca5eab38f48123b5c14a5b2f3c03e231026606bdc740eabc"
  license :cannot_represent

  livecheck do
    url "https://docs.couchbase.com/couchbase-lite/3.1/c/gs-downloads.html"
    regex(/href=.*?couchbase[._-]lite[._-]c[._-]enterprise[._-]v?(\d+(?:\.\d+)+)[._-]macos\.zip/i)
  end

  keg_only :versioned_formula

  def install
    include.install Dir["include/*"]
    lib.install "lib/libcblite.#{version}.dylib"
    (lib/"cmake").install "lib/cmake/CouchbaseLite"
    lib.install_symlink "libcblite.#{version}.dylib" => "libcblite.#{version.major}.dylib"
    lib.install_symlink "libcblite.#{version.major}.dylib" => "libcblite.dylib"
  end
end
