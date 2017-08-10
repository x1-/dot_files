export LANG=ja_JP.UTF-8
export LD_LIBRARY_PATH=/usr/local/lib
export LIBRARY_PATH=/usr/local/lib

########################################
# env
set -x EDITOR /usr/bin/vim

set -U JAVA_HOME (/usr/libexec/java_home -v 1.8)
set -U M2_HOME $HOME/tools/maven
set -U ANACONDA_HOME /usr/local/anaconda
set -U PYTHON_PACKAGES $ANACONDA_HOME/lib/python2.7/site-packages
set -U MAVEN_OPTS "-Xmx2g -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512M"

set -U fish_user_paths $fish_user_paths /usr/local/bin $JAVA_HOME/bin $ANACONDA_HOME/bin $HOME/bin $HOME/tools/scala/bin $HOME/tools/jad

########################################
# home brew
if test -e $HOME/.brew_api_token
  source $HOME/.brew_api_token
end

