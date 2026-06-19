class LibcbliteAT30 < Formula
  desc "Couchbase Lite C and C++ libraries (Enterprise Edition)"
  homepage "https://docs.couchbase.com/couchbase-lite/current/"
  url "https://packages.couchbase.com/releases/couchbase-lite-c/3.0.15/couchbase-lite-c-enterprise-3.0.15-macos.zip"
  sha256 "e53a3a3071ef68d17f61a710e8d9d2aa489b5b8cb29cd19bac3d9871d4548b1f"
  license :cannot_represent

  livecheck do
    url "https://docs.couchbase.com/couchbase-lite/3.0/c/gs-downloads.html"
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
