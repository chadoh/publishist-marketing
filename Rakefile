require 'aws'
require 'yaml'
require 'logger'
require 'mime-types'

log = Logger.new(STDOUT)
log.level = Logger::INFO

config = YAML.load_file("config.yml")
pwd = Dir.getwd

namespace :aws do
  desc "Deploy to S3."
  task :s3 do

    s3 = Aws::S3.new(
      config[:aws][:access_key_id],
      config[:aws][:secret_access_key]
    )

    bucket = s3.bucket(config[:deploy][:s3_bucket], true)

    Dir.chdir(config[:deploy][:from_folder])

    log.info("Beginning to deploy files")

    Dir["**/*"].each do |file|
      next if File.directory?(file)
      mime_type = MIME::Types.type_for(file).first.simplified
      log.debug("Uploading #{file} with Content-Type: #{mime_type}")
      headers = {'content-type' => mime_type}
      bucket.put(file,File.read(file),{},'public-read',headers)
    end

    log.info("Done!")

    Dir.chdir(pwd)
  end

  desc "Deploy files to S3"
  task :deploy => [:s3]

  task :default => :deploy
end
