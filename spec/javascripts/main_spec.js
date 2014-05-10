describe("Hello world", function() {
    it("says hello", function() {
        expect(helloWorld()).toEqual("Hello world!");
    });
});

describe("Hello world part 2", function() {
    it("says hello", function() {
        expect(helloWorld2()).toEqual("Hello world again!");
    });
});
