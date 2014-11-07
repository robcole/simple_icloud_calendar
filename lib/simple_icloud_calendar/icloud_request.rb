module SimpleIcloudCalendar
  class IcloudRequest

    attr_accessor :ics_file

    def initialize(url)
      # TODO: Make @cache_path user-configurable.
      #store = ActiveSupport::Cache.lookup_store(:file_store, cache_dir)
      @cache_path = find_or_create_path('/tmp/simple-icloud-calendar')
      url = check_ical_url(url)
      @cache_file, @meta_file = filename_from_url(url)
      @ics_file = load_from_cache(url)
    end

    def load_from_cache(url)
      if cache_exists?
        begin
          open(url, "If-None-Match" => etag) do |feed|
            #puts "Cache is expired. Invalidating cache and re-caching feed."
            invalidate_cache
            save_cache(feed)
          end
        rescue OpenURI::HTTPError
          #puts "Cache exists and is not expired. Loading from cache."
        end
      else
        #puts "Cache was not found. Creating cache."
        save_cache(url)
      end
      get_cache
    end

    def get_cache
      @cache = File.read(@cache_file)
    end

    def save_cache(feed)
      set_cache(feed)
      set_etag(feed)
      feed.read
    end

    def save_cache(url)
      open(url) do |feed|
        save_cache(feed)
      end
    end

    def set_cache(feed)
      File.open(@cache_file, 'wb') { |f| f.write feed.read }
      feed
    end

    def set_etag(feed)
      File.open(@meta_file, 'wb') { |f| f.write feed.meta["etag"] }
      feed.meta["etag"]
    end

    def cache_exists?
      File.exists?(@cache_file) && File.exists?(@meta_file)
    end

    def etag
      @etag = File.read(@meta_file)
    end

    def invalidate_cache
      File.delete(@cache_file)
      File.delete(@meta_file)
    rescue Errno::ENOENT
      false
    end

    def filename_from_url(url)
      cache_file = [@cache_path, Digest::SHA1.hexdigest(url)].join('/')
      meta_file = cache_file + ".meta"
      [cache_file, meta_file]
    end

    def check_ical_url(ical_url)
      msg = "Failed to set ical_url to a valid iCalendar URL"
      ical_url = ical_url.gsub('webcal', 'https')
      fail(msg) unless valid_url?(ical_url)
      return ical_url
    end

    def valid_url?(url)
      u = URI.parse(url)
      u.kind_of?(URI::HTTP) || u.kind_of?(URI::HTTPS)
    end

    def find_or_create_path(path)
      unless File.directory?(path)
        FileUtils.mkdir_p(path)
      end
      path
    end

  end
end
