var app = app || {};

app.ResultView = Backbone.View.extend({
	el: '#searchResults',

	initialize: function( track ) {
		this.track = track;
	},

	render: function() {
		var resultsTemplate = $('#resultTemplate').html();

		$resultsTemplate = $(resultsTemplate);
		$resultsTemplate.text(this.track.title);

		var thisResultView = this;
		$resultsTemplate.on('click', function() {
			console.log(thisResultView.track.title);

			app.snowFlakeView = new app.SnowFlakeView( thisResultView.track );
			app.snowFlakeView.render();
		});

		this.$el.prepend( $resultsTemplate );
	}
});