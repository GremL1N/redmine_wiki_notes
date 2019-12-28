# Wiki Notes plugin for Redmine
# Copyright (C) 2010 Daniel Seifert
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require 'redmine'
begin
  require 'config/initializers/session_store.rb'
  rescue LoadError
end

def init_redmine_wiki_notes
  Dir::foreach(File.join(File.dirname(__FILE__), 'lib')) do |file|
    next unless /\.rb$/ =~ file
    require_dependency file
  end
end

if Rails::VERSION::MAJOR >= 5 and Rails::VERSION::MINOR >= 1
  reloader = ActiveSupport::Reloader
else
  reloader = ActionDispatch::Callbacks
end
reloader.to_prepare do
  init_redmine_wiki_notes
end

require 'RedCloth'
Redmine::Plugin.register :redmine_wiki_notes do
  name 'Redmine Wiki Notes plugin'
  author 'Daniel Seifert, Victor Laborie'
  description 'Allows adding different kinds of notes into a wiki page'
  url "http://www.github.com/GremL1N/redmine_wiki_notes" if respond_to?(:url)
  version '0.0.4'
  requires_redmine :version_or_higher => '2.3.0'

  RedCloth3::ALLOWED_TAGS << "div"
end
