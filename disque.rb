class Disque < Formula
  desc "In memory distributed job queue"
  homepage "https://github.com/antirez/disque"
  head "https://github.com/antirez/disque.git"

  def install
    system "make", "PREFIX=#{prefix}", "CC=#{ENV.cc}"

    bin.install "src/disque"
    bin.install "src/disque-check-aof"
    bin.install "src/disque-server"

    %w[run db/disque log].each { |p| (var+p).mkpath }

    inreplace "disque.conf" do |s|
      s.gsub! "/var/run/disque.pid", "#{var}/run/disque.pid"
      s.gsub! "dir ./", "dir #{var}/db/disque"
      s.gsub! "\# bind 127.0.0.1", "bind 127.0.0.1"
    end

    etc.install "disque.conf"
  end

  plist_options :manual => "disque-server #{HOMEBREW_PREFIX}/etc/disque.conf"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>KeepAlive</key>
        <dict>
          <key>SuccessfulExit</key>
          <false/>
        </dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/disque-server</string>
          <string>#{etc}/disque.conf</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>WorkingDirectory</key>
        <string>#{var}</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/disque.log</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/disque.log</string>
      </dict>
    </plist>
    EOS
  end

  test do
    system "#{bin}/disque-server", "--test-memory", "2"
  end
end
