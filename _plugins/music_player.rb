Jekyll::Hooks.register [:pages, :documents], :post_render do |item|
  if item.output_ext == ".html"
    player = <<~HTML
      <div style="
        position:fixed;
        bottom:24px;
        right:24px;
        z-index:9999;
        background:rgba(30,30,30,0.75);
        backdrop-filter:blur(8px);
        border-radius:999px;
        padding:6px 14px 6px 10px;
        box-shadow:0 2px 12px rgba(0,0,0,0.25);
        display:flex;
        align-items:center;
        gap:8px;
      ">
        <span style="font-size:14px;">🎵</span>
        <audio controls loop style="
          width:180px;
          height:28px;
          outline:none;
          accent-color:#1DB954;
        ">
          <source src="/assets/bgm.mp3" type="audio/mpeg">
        </audio>
      </div>
    HTML
    item.output = item.output.gsub("</html>", "#{player}</html>")
  end
end
