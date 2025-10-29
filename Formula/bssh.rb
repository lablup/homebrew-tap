class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.2.2"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.2.2/bssh-macos-aarch64.zip"
      sha256 "2b96a3a950fb5e770fb7149bc865e19f14b425092a0396770dd809b7cfffaac9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.2.2/bssh-linux-aarch64.tar.gz"
      sha256 "9487f39a06846772f5a7ef07a21e7ffe244ef77be0dfde31791d2fbfa2ba4d72"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.2.2/bssh-linux-x86_64.tar.gz"
      sha256 "20e15fe5df85b312004af84cfe1e278f0eaf7c03cc48b435786bdac4468ca6f0"
    end
  end

  def install
    bin.install "bssh"
    man1.install "bssh.1"
  end

  test do
    output = shell_output("#{bin}/bssh --version")
    assert_match(/bssh\s+#{version}/, output)
  end
end
