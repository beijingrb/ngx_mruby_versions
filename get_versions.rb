require 'rest-client'
require 'json'

def get_versions()
  api_url = 'https://api.github.com/repos/matsumotory/ngx_mruby/releases?page=1&per_page=50'
  JSON.parse(RestClient.get api_url || []).sort_by {|r| r["created_at"]}.map do |r|
    r["tag_name"].sub(/^v/, "") || ""
  end
end

vers = get_versions
File.write("./versions.txt", vers.join("\n")) if vers.length > 0
