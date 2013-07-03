require 'ec2_backup/config'

describe Ec2Backup::Config do
  let(:config) { { key: 'abc', secret: '123', region: 'us-west-1' } }

  it "should allow manual initiation" do
    subject.set_config(config)
    subject.key.should    == 'abc'
    subject.secret.should == '123'
    subject.region.should == 'us-west-1'
  end

  it "should throw an exception if the config file can't be found" do
    File.stub!(:exists?).and_return(false)
    expect{subject.load_config}.to raise_error "config file not found"
  end

  describe "reading config files" do
    before do
      File.stub!(:exists?).and_return(true)
      YAML.stub!(:load_file).and_return(config)
    end

    it "should load the config" do
      subject.load_config('./test.config')
      subject.key.should    == 'abc'
      subject.secret.should == '123'
      subject.region.should == 'us-west-1'
    end
  end
end
