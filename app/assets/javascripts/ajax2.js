$(function () {

History = window.History
	History.Adapter.bind(window,'statechange',function(){
		State = History.getState()
//		History.log(State.url)
	})
})
