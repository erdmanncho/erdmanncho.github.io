Jekyll::Hooks.register [:pages, :documents], :post_render do |item|
  if item.output_ext == ".html"
    player = <<~HTML
      <div style="position:fixed;bottom:20px;left:20px;z-index:9999;">
        <audio controls autoplay loop style="width:300px;border-radius:8px;">
          <source src="/assets/bgm.mp3" type="audio/mpeg">
        </audio>
      </div>
    HTML
    item.output = item.output.gsub("</html>", "#{player}</html>")
  end
end
