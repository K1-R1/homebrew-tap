class Smoosh < Formula
  desc "Pure bash CLI that aggregates repository files for RAG ingestion"
  homepage "https://github.com/K1-R1/smoosh"
  url "https://github.com/K1-R1/smoosh/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  def install
    bin.install "smoosh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/smoosh --version")
  end
end
