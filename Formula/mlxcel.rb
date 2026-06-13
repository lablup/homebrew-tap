class Mlxcel < Formula
  desc      "MLX inference engine for Apple Silicon (Rust + native MLX C++ bindings)"
  homepage  "https://github.com/lablup/mlxcel"
  version "0.2.1"
  license   "Apache-2.0"

  # Release artifacts are built with MACOSX_DEPLOYMENT_TARGET=14.0 and target
  # aarch64-apple-darwin. Older macOS releases or Intel Macs cannot load the
  # bundled mlx.metallib, so the formula refuses to install on them rather
  # than producing a runtime crash.
  depends_on macos: :sonoma
  depends_on arch: :arm64

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/mlxcel/releases/download/v0.2.1/mlxcel-macos-aarch64.zip"
      sha256 "85ecf5d61d495b030b74d35a7b791853dfead1f36e99ae71cb859b6d8c5875c0"
    end
  end

  def install
    # Keep mlxcel + mlxcel-server colocated with mlx.metallib in libexec/.
    # MLX's Metal device loader searches "the same path as this binary" first
    # (see mlx upstream backend/metal/device.cpp), so colocation makes the
    # runtime lookup work without any environment variable.
    libexec.install "mlxcel", "mlxcel-server", "mlx.metallib"
    bin.write_exec_script libexec/"mlxcel"
    bin.write_exec_script libexec/"mlxcel-server"
  end

  test do
    output = shell_output("#{bin}/mlxcel --version")
    assert_match "mlxcel #{version}", output
  end
end
