Pod::Spec.new do |s|
  s.name           = 'OpenVoters'
  s.version        = '1.0.0'
  s.license        = { :type => 'LGPL v. 3', :text => '
                         This file is part of OpenVoters, the open library for mobile voting.

                         OpenVoters is free software: you can redistribute it and/or modify
                         it under the terms of the GNU General Public License as published by
                         the Free Software Foundation, either version 3 of the License, or
                         (at your option) any later version.

                         OpenVoters is distributed in the hope that it will be useful,
                         but WITHOUT ANY WARRANTY; without even the implied warranty of
                         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                         GNU General Public License for more details.

                         You should have received a copy of the GNU General Public License
                         along with OpenVoters.  If not, see <http://www.gnu.org/licenses/>.
                     '}
  s.summary        = 'An iOS tool for connection to a remote OpenVoters-powered server.'
  s.homepage       = 'http://www.openvoters.org/'
  s.authors        = {'Daniele Di Bernardo' => 'daniele.dib@gmail.com'}
  s.source         = { :git => 'https://github.com/openvoters/ios-lib', :tag => '1.0.0' }
  s.source_files   = 'Classes/**/*.{h,m}'
  s.platform       = :ios
  s.dependency     = 'AFJSONRPCClient'
end
