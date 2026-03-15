class Smoosh < Formula
  desc "Pure bash CLI that aggregates repository files for RAG ingestion"
  homepage "https://github.com/K1-R1/smoosh"
  url "https://github.com/K1-R1/smoosh/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "6837c720a6e4a3a34503d93eb162ba1104f60d7ca5ef73fb2308b9a4096033f8"
  license "MIT"

  def install
    bin.install "smoosh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/smoosh --version")
    system "git", "init", testpath/"repo"
    system "git", "-C", testpath/"repo", "config", "user.email", "test@brew.sh"
    system "git", "-C", testpath/"repo", "config", "user.name", "Test"
    (testpath/"repo/README.md").write("# Hello\n\nSmoke test.\n")
    system "git", "-C", testpath/"repo", "add", "README.md"
    system "git", "-C", testpath/"repo", "commit", "-m", "init"
    system bin/"smoosh", "--no-interactive", "--docs", testpath/"repo"
    assert_predicate testpath/"repo/_smooshes", :directory?
  end
end
