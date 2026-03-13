class CbliteAT3 < Formula
  desc "Couchbase cblite 3 command-line tool"
  homepage "https://github.com/couchbaselabs/couchbase-mobile-tools"
  url "https://github.com/couchbaselabs/couchbase-mobile-tools.git",
    branch:   "release/3.2",
    revision: "1755d395131073e173f9a4f984e84084c144c18f"
  version "3.2.0"
  license "Apache-2.0"

  depends_on "cmake" => :build

  # cherry-pick https://github.com/couchbase/fleece/commit/230b240439bbf3c7fbf3345ca6f60741408ec0f4
  patch :DATA

  def install
    system "cmake", "-S", "cblite", "-B", "build", *std_cmake_args,
      "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
    system "cmake", "--build", "build", "--target", "cblite"
    bin.install "build/cblite" => "cblite-3"
  end

  test do
    system bin/"cblite-3", "--version"
  end
end

__END__
diff --git i/vendor/couchbase-lite-core/vendor/fleece/API/fleece/InstanceCounted.hh w/vendor/couchbase-lite-core/vendor/fleece/API/fleece/InstanceCounted.hh
index 56c04a5..8d879b9 100644
--- i/vendor/couchbase-lite-core/vendor/fleece/API/fleece/InstanceCounted.hh
+++ w/vendor/couchbase-lite-core/vendor/fleece/API/fleece/InstanceCounted.hh
@@ -47,9 +47,9 @@ namespace fleece {
 
     protected:
         InstanceCounted(size_t offset)              {track(offset);}
+        void untrack() const;
     private:
         void track(size_t offset =0) const;
-        void untrack() const;
         static void dumpInstances(function_ref<void(const InstanceCounted*)>*);
 
 #else
