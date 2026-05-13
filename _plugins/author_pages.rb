module Jekyll
  class AuthorPage < Page
    def initialize(site, base, slug, data)
      @site  = site
      @base  = base
      @dir   = File.join("autores", slug)
      @name  = "index.html"
      self.process(@name)
      self.read_yaml(File.join(base, "_layouts"), "autor.html")
      self.data["title"]      = data["nome"] || slug
      self.data["autor_slug"] = slug
      self.data["layout"]     = "autor"
    end
  end

  class AuthorPageGenerator < Generator
    safe true

    def generate(site)
      return unless site.data["autores"]
      site.data["autores"].each do |slug, author_data|
        site.pages << AuthorPage.new(site, site.source, slug, author_data)
      end
    end
  end
end
