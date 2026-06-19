class LibcbliteAT40 < Formula
  desc "Couchbase Lite C and C++ libraries (Enterprise Edition)"
  homepage "https://docs.couchbase.com/couchbase-lite/current/"
  url "https://packages.couchbase.com/releases/couchbase-lite-c/4.0.3/couchbase-lite-c-enterprise-4.0.3-macos.zip"
  sha256 "e4ddd88181f7781e767b9c66ac2bb17e058a2968cf6c1f6ed434c1313f5cc695"
  license :cannot_represent

  livecheck do
    url "https://docs.couchbase.com/couchbase-lite/4.0/c/gs-downloads.html"
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
