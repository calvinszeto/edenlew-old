#= require spec_helper

describe "dateRange filter", ->
  beforeEach ->
    @dateRange = @injector.get 'dateRangeFilter'


  describe "with finish date", ->
    describe "with start date", ->
      it "should return a range", ->
        expect(@dateRange('2012-07-01', '2012-06-01')).toEqual("June - July 2012")

    it "should return the finish date", ->
      expect(@dateRange('2012-07-01')).toEqual("July 2012")

  describe "without finish date", ->
    it "should return blank", ->
      expect(@dateRange("")).toEqual("")
