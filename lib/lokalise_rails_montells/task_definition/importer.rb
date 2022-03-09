# frozen_string_literal: true

require 'zip'
require 'yaml'
require 'open-uri'
require 'fileutils'

module LokaliseRailsMontells
  module TaskDefinition
    class Importer < Base
      class << self
        def proceed_when_safe_mode?
          return true unless LokaliseRailsMontells.import_safe_mode &&
                             !Dir.empty?(LokaliseRailsMontells.locales_path.to_s)

          $stdout.puts "The target directory #{LokaliseRailsMontells.locales_path} is not empty"
          $stdout.print 'Enter Y to continue: '
          answer = $stdout.gets
          answer.to_s.strip == 'Y'
        end

        def open_file_or_remote(path)
          parsed_path = URI.parse(path)
          if parsed_path&.scheme&.include?(path)
            parsed_path.open
          else
            File.open path
          end
        end

        def fetch_zip_entries(zip)
          return unless block_given?

          zip.each do |entry|
            next unless proper_ext? entry.name

            yield entry
          end
        end

        def open_and_process_zip(path)
          Zip::File.open_buffer(open_file_or_remote(path)) do |zip|
            fetch_zip_entries(zip) { |entry| process!(entry) }
          end
        end

        def sub_directory_and_file_name(entry)
          Pathname.new(entry).split
        end

        def process!(zip_entry)
          data = YAML.safe_load(zip_entry.get_input_stream.read)

          sub_directory, file_name = sub_directory_and_file_name(zip_entry.name)
          full_path = "#{LokaliseRailsMontells.locales_path}/#{sub_directory}"
          FileUtils.mkdir_p full_path

          File.open(File.join(full_path, file_name), 'w+:UTF-8') do |f|
            f.write data.to_yaml
          end
        rescue StandardError => e
          $stdout.puts "Error when trying to process #{zip_entry&.name}: #{e.inspect}"
        end

        def download_files
          opts = LokaliseRailsMontells.import_opts

          api_client.download_files LokaliseRailsMontells.project_id, opts
        rescue StandardError => e
          $stdout.puts "There was an error while downloading files: #{e.inspect}"
        end

        def import!
          unless proceed_when_safe_mode?
            $stdout.print 'Task cancelled!'

            return false
          end

          open_and_process_zip download_files['bundle_url']

          $stdout.print 'Task completed!'
          true
        end
      end
    end
  end
end
