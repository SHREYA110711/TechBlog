
package com.tech.blog.entities;

public class Message {
    
    private String content;
    private String msgType;
    private String cssClass;

    public Message(String content, String msgType, String cssClass) {
        this.content = content;
        this.msgType = msgType;
        this.cssClass = cssClass;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMsgType() {
        return msgType;
    }

    public void setMsgType(String msgType) {
        this.msgType = msgType;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }
    
    
}
