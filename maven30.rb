class Maven30 < Formula
  desc "Java-based project management"
  homepage "https://maven.apache.org/"
  url "http://www.carfab.com/apachesoftware/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz"
  sha256 "9a9a78e2e344c1674d634def944e0a46b53753b541a46454d2921ba16fe6931e"

  conflicts_with "maven", :because => "Differing versions of same formula"

  depends_on :java

  def install
    # Remove windows files
    rm_f Dir["bin/*.bat"]

    # Fix the permissions on the global settings file.
    chmod 0644, "conf/settings.xml"

    prefix.install_metafiles
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
