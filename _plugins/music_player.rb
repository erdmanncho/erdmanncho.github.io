Jekyll::Hooks.register [:pages, :documents], :post_render do |item|
  if item.output_ext == ".html"
    player = <<~HTML
      <!-- 🎵 Music Player -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.css">
      <script src="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/meting@2/dist/Meting.min.js"></script>
      <meting-js
        server="netease"
        type="playlist"
        id="29352917"
        fixed="true"
        autoplay="false"
        theme="#1DB954"
        order="random"
        loop="all">
      </meting-js>
    HTML
    item.output = item.output.gsub("</body>", "#{player}</body>")
  end
end
