class Smoosh < Formula
  desc "Pure bash CLI that aggregates repository files for RAG ingestion"
  homepage "https://github.com/K1-R1/smoosh"
  url "https://github.com/K1-R1/smoosh/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "893cea99ab3ae80181baa13108635c0b90ecc84f7ba316ef5fc8b0e00443e7aa"
  license "MIT"

  def install
    bin.install "smoosh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/smoosh --version")
  end
end
