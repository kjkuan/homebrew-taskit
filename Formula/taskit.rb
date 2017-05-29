class Taskit < Formula
  desc "A Task Runner in Bash."
  homepage "https://github.com/kjkuan/taskit"
  url "https://github.com/kjkuan/taskit", :using => :git, :tag => '1.0.0', :nounzip => true
  sha256 "86b3b2b42ecb2f98de4a3c36b31819ec4c84cf6d70d19730be58febb84aada7b"
  head "https://github.com/kjkuan/taskit", :using => :git 

  depends_on "bash" => :run
  depends_on "coreutils" => :run

  def install
    bin.install "taskit"

    ohai "Taskit relies on Bash >= 4.3 and GNU Coreutils to function correctly."
    ohai "Therefore, it's recommended you add them to PATH if you haven't."
    ohai 'E.g., add these lines to your ~/.bashrc:

      export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
      export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
    '
  end

  test do
    system '
      export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
      taskit -h
    '
  end
end
