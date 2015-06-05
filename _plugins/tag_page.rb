module Jekyll
  class TagPage < Page
    include Convertible
    attr_accessor :site, :pager, :name, :ext
    attr_accessor :basename, :dir, :data, :content, :output

    def initialize(site, tag, posts)
      @site = site
      @tag = tag
      self.ext = '.html'
      self.basename = 'index'
      self.content = <<-EOS
{% for post in page.posts %}
<h3 class="post-title"><a href="{{ post.url }}">{{ post.title }}{% if post.external_url %}{{site.link_char}}{% endif %}</a></h3>
<p class="post-meta">{{ post.date | date: "%b %-d, %Y" }}{% if post.author %} • {{ post.author }}{% endif %}{% if post.meta %} • {{ post.meta }}{% endif %}</p>
<blockquote>{{ post.content | truncatewords: 20 }}</blockquote>

<p>
{% if post.categories != empty %}
In {{ post.categories | array_to_sentence_string }}.
{% endif %}
{% if post.tags != empty %}
Tagged <span class="tags">{% for tag in post.tags %}<a href="{{site.base_url}}/tags/{{ tag }}/">{{ tag }}</a> {% endfor %}</span>
</p>
{% endif %}
{% endfor %}
EOS
      self.data = {
        'layout' => 'page',
        'type' => 'tag',
        'title' => "Posts tagged \"#{@tag}\"",
        'posts' => posts
      }
    end

    def render(layouts, site_payload)
      payload = Utils.deep_merge_hashes({
        "page" => self.to_liquid,
        "paginator" => pager.to_liquid
      }, site_payload)
      do_layout(payload, layouts)
    end

    def url
      File.join("/tags", @tag, "index.html")
    end

    def to_liquid
      Utils.deep_merge_hashes(self.data, ({
                             "url" => self.url,
                             "content" => self.content
                           }))
    end

    def write(dest_prefix, dest_suffix = nil)
      dest = dest_prefix
      dest = File.join(dest, dest_suffix) if dest_suffix
      path = File.join(dest, CGI.unescape(self.url))
      FileUtils.mkdir_p(File.dirname(path))
      File.open(path, 'w') do |f|
        f.write(self.output)
      end
    end

    def html?
      true
    end
  end
end
