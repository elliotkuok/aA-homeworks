class LRUCache
    attr_reader :cache
    def initialize(size)
        @cache = []
        @size = size
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
        if @cache.include?(el)
            @cache.delete(el)
            @cache << el
        elsif count < @size
            @cache << el
        else
            @cache.shift
            @cache << el
        end
    end

    def show
      # shows the items in the cache, with the LRU item first
        @cache
    end

    private
    # helper methods go here!

  end
