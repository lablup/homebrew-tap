class Mlxcel < Formula
  desc      "MLX inference engine for Apple Silicon (Rust + native MLX C++ bindings)"
  homepage  "https://github.com/lablup/mlxcel"
  url "https://github.com/lablup/mlxcel/releases/download/v0.5.1/mlxcel-macos-aarch64.zip"
  version "0.5.1"
  sha256 "088b1f16d7b8a13494cd7425251e87a3bb79a54ee9058d68a300d6bbfe3eb6d5"
  license "Apache-2.0"

  # This formula packages only the aarch64-apple-darwin artifact, which is built
  # with MACOSX_DEPLOYMENT_TARGET=14.0. Older macOS releases and Intel Macs
  # cannot load the bundled mlx.metallib, so the formula refuses to install on
  # them rather than producing a runtime crash. Upstream also publishes
  # linux-{aarch64,x86_64}-cuda13 artifacts; they are not wired up here because
  # they require a CUDA 13 runtime and ship the server as a separate archive.
  # The url stays at the top level instead of inside an `on_macos` block so the
  # formula still loads on Linux; these `depends_on` lines gate installation.
  depends_on arch: :arm64
  depends_on macos: :sonoma

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
