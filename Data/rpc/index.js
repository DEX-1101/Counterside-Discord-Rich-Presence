const RPC = require("discord-rpc");
const client = new RPC.Client({transport: "ipc"});

const activity = {
    details: "Playing",
    assets: {
        large_image: "1",
        large_text: "COUNTER:SIDE",
        },
    timestamps: {start: Date.now()},
    instance: true
};
client.on("ready", () => {
    client.request("SET_ACTIVITY", {pid: process.pid, activity: activity});
    console.log("RPC is Online");
})
client.login({ clientId: "845481271190749204" });