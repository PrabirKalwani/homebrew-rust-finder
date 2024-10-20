class RustFinder < Formula
    desc "Rapid Rust Finder – A faster finder built in Rust"
    homepage "https://rust.prabir.in"
    url "https://rapid-rust-finder.s3.eu-north-1.amazonaws.com/rust-finder.dmg"
    sha256 "2687412e0cce3072fa0ecd8226744063c474a0fad0559d88aefd0d65eb496b23" # Replace with actual checksum
    version "0.1.0"
  
    def install
      dmg_name = "rust-finder"
      volume_name = "/Volumes/#{dmg_name}"
  
      # Mount the DMG
      system "hdiutil", "attach", cached_download
  
      # Copy the .app file from the root of the mounted DMG to Homebrew's prefix directory
      system "cp", "-r", "#{volume_name}/rust-finder.app", "#{prefix}/"
  
      # Detach the DMG
      system "hdiutil", "detach", volume_name
  
      # Symlink the binary for command-line use
      bin.install_symlink("#{prefix}/rust-finder.app/Contents/MacOS/rust-finder" => "rust-finder")
    end
  
    def caveats
      <<~EOS
        The application "rust-finder.app" has been installed.
        You can run it using the command "rust-finder in your terminal".
      EOS
    end
  end
  