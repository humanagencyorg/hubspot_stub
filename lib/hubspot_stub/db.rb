require "pstore"
require "singleton"

module HubspotStub
  class Db
    FILENAME = "hubspot-stub.store".freeze

    include Singleton

    def initialize
      @db = PStore.new(FILENAME, true)
    end

    def write(name, value)
      @db.transaction { @db[name] = value }
    end

    def read(name)
      @db.transaction(true) { @db[name] }
    end

    def delete(name)
      @db.transaction { @db.delete(name) }
    end

    def clear_all
      FileUtils.rm_f(FILENAME)
    end
  end
end
