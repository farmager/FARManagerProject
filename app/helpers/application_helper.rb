module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "FARManager"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
 @my_blockquote = {
    'Quote' => [
      /\[quote\](.*?)\[\/quote\1?\]/mi,
      '<blockquote>\3</blockquote>',
      'Quote with citation',
      '[quote=mike]please quote me[/quote]',
      :quote
    ],      
  }
  
  
end

