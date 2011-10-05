require File.join(File.dirname(__FILE__),'..','spec_helper')

describe "Alumno" do
  it_should_behave_like "SpecHelper"
  
  before(:each) do
    setup_test_for Alumno,'testuser'
  end
  
  it "should process Alumno query" do
    pending
  end
  
  it "should process Alumno create" do
    pending
  end
  
  it "should process Alumno update" do
    pending
  end
  
  it "should process Alumno delete" do
    pending
  end
end