# frozen_string_literal: true

require 'test_helper'
require 'rake'

class IngestReturnsTest < ActiveSupport::TestCase
  describe '#rake db:ingest:returns' do
    Given(:execute) do
      Rake.application.rake_require 'tasks/db/ingest/returns'
      Rake::Task.define_task(:environment)
      Rake::Task['db:ingest:returns'].reenable
      Rake::Task['db:ingest:returns'].invoke('201612429349300846')
    end

    describe 'must create organizations' do
      Given(:eins) do
        %w[200253310
           954527969
           231352683]
      end
      Given(:names) do
        [
          'Pasadena Community Foundation',
          'The Frostig Center',
          'University of Virginia Darden School'
        ]
      end
      Then do
        assert_difference -> { Org.count } => 132,
                          -> { Award.count } => 137,
                          -> { Filing.count } => 1,
                          -> { AwardsFiling.count } => 137 do
                            execute
                          end
      end
      And { eins.each { |ein| assert_includes Org.pluck(:ein), ein } }
      And { names.each { |name| assert_includes Org.pluck(:name), name } }
    end

    describe 'must create organizations' do
      Given { execute }
      Given(:filer) { Org.find_by(ein: '200253310') }
      Given(:recipient) { Org.find_by(ein: '951980801') }
      Given(:awards) { Award.where(granter: filer, recipient:) }

      describe 'filer' do
        Then do
          assert_equal filer.name, 'Pasadena Community Foundation'
          assert_equal filer.line_1, '301 E Colorado Blvd No 810'
          assert_equal filer.city, 'Pasadena'
          assert_equal filer.state, 'CA'
          assert_equal filer.zip, '91101'
          assert_equal filer.address, '301 E Colorado Blvd No 810/nPasadena, CA  91101'
        end
      end

      describe 'recipient' do
        Then do
          assert_equal recipient.name, 'All Saints Church'
          assert_equal recipient.line_1, '132 N Euclid Ave'
          assert_equal recipient.city, 'Pasadena'
          assert_equal recipient.state, 'CA'
          assert_equal recipient.zip, '91101'
          assert_equal recipient.address, '132 N Euclid Ave/nPasadena, CA  91101'
        end
      end

      describe 'award' do
        Then do
          assert_includes awards.pluck(:amount), 86_200
          assert_includes awards.pluck(:purpose), 'General Support'
          assert_equal 1, awards.count
        end
      end
    end
  end
end
