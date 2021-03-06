# Read and write the schemas
module SchemaGenerator
  class Schema
    def self.read(filename)
      @parsed_json_cache ||= {}
      @parsed_json_cache[filename] ||= JSON.parse(File.read(filename))
    end

    def self.write(full_filename, schema_hash)
      schema_json = JSON.pretty_generate(schema_hash) + "\n"
      FileUtils.mkdir_p(File.dirname(full_filename))
      File.write(full_filename, schema_json)
    end
  end
end
