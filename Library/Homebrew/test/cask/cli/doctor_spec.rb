require_relative "shared_examples/invalid_option"

describe Hbc::Cmd::Doctor, :cask do
  it_behaves_like "a command that handles invalid options"

  it "displays some nice info about the environment" do
    expect {
      Hbc::Cmd::Doctor.run
    }.to output(/\A==> Homebrew Cask Version/).to_stdout
  end

  it "raises an exception when arguments are given" do
    expect {
      Hbc::Cmd::Doctor.run("argument")
    }.to raise_error(ArgumentError)
  end
end
