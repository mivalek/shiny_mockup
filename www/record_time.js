$(document).ready( // when the shiny app has finished loading
  () => $("#start") // select the HTML element with id="start", i.e., our button
    .one("click", e => { // add a one-time click event listener
      const date = new Date();
      const localTime = date.toLocaleTimeString(); // user's local time
      const timeZone = date.getTimezoneOffset() / 60; // offset from GMT in hours
      const out = {time: localTime, zone: timeZone};
      console.log(out) // print in console, not needed
      Shiny.setInputValue( // send to the shiny server
        "startTime", // accessible as input$sratTime
        JSON.stringify(out)); // out variable as string
    })
);