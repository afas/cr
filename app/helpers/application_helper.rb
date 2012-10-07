module ApplicationHelper
  def title(title_text, print=false)
    content_for(:title) { title_text }
    content_tag('h1', title_text) if print
  end

  def hidden_div_if(condition, attributes = {}, &block)
    attributes[:style] = 'display: none' if condition
    content_tag('div', attributes, &block)
  end
end
