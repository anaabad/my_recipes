require 'testcontainers/postgres'
module TestPostgres
  def self.start
    @container ||= begin
                     container = Testcontainers::PostgresContainer.new
                                                                  .with_database('test')
                                                                  .with_username('postgres')
                                                                  .with_password('secret')
                                                                  .start

                     {
                       'PGHOST'     => container.host,
                       'PGPORT'     => container.first_mapped_port.to_s,
                       'PGDATABASE' => 'test',
                       'PGUSER'     => 'postgres',
                       'PGPASSWORD' => 'secret'
                     }
                   end
  end
end