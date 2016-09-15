<#include "macro-home.ftl">
<#include "../macro-pagination.ftl">
<@home "${type}">
<div class="tabs-sub fn-clear">
    <a href="${servePath}/member/${user.userName}/following/users"<#if type == "followingUsers"> class="current"</#if>>${followingUsersLabel}</a>
    <a href="${servePath}/member/${user.userName}/following/tags"<#if type == "followingTags"> class="current"</#if>>${followingTagsLabel}</a>
    <a href="${servePath}/member/${user.userName}/following/articles"<#if type == "followingArticles"> class="current"</#if>>${followingArticlesLabel}</a>
    <a href="${servePath}/member/${user.userName}/followers"<#if type == "followers"> class="current"</#if>>${followersLabel}</a>
</div>
<#if 0 == user.userFollowingUserStatus || (isLoggedIn && ("adminRole" == currentUser.userRole || currentUser.userName == user.userName))>
<div class="follow list">
    <ul>
        <#list userHomeFollowingUsers as followingUser>
        <li>
            <div class="fn-flex">
                <a rel="nofollow ft-gray"  
                   href="${servePath}/member/${followingUser.userName}">
                    <div class="avatar fn-left tooltipped tooltipped-se" 
                         aria-label="${followingUser.userName} <#if followingUser.userOnlineFlag>${onlineLabel}<#else>${offlineLabel}</#if>" 
                         style="background-image:url('${followingUser.userAvatarURL}')"></div>
                </a>
                <div class="fn-flex-1">
                    <h2 class="fn-inline">
                        <a rel="nofollow" href="${servePath}/member/${followingUser.userName}" >${followingUser.userName}</a>
                    </h2> &nbsp;
                    <#if isLoggedIn && (userName != followingUser.userName)> 
                    <#if followingUser.isFollowing>
                    <button class="red small" onclick="Util.unfollow(this, '${followingUser.oId}', 'user')"> 
                        ${unfollowLabel}
                    </button>
                    <#else>
                    <button class="green small" onclick="Util.follow(this, '${followingUser.oId}', 'user')"> 
                        ${followLabel}
                    </button>
                    </#if>
                    </#if>
                    <div>
                        <#if followingUser.userArticleCount == 0>
                        <#if followingUser.userURL != "">
                        <a class="ft-gray" target="_blank" rel="friend" href="${followingUser.userURL?html}">${followingUser.userURL?html}</a>
                        <#else>
                        <span class="ft-gray">${symphonyLabel}</span>
                        ${followingUser.userNo?c}
                        <span class="ft-gray">${numVIPLabel}</span>
                        </#if>
                        <#else>
                        <span class="ft-gray">${articleLabel}</span> ${followingUser.userArticleCount?c} &nbsp;
                        <span class="ft-gray">${tagLabel}</span> ${followingUser.userTagCount?c}
                        </#if>
                    </div>
                </div>
            </div>
        </li>
        </#list>
    </ul>
</div>
<@pagination url="/member/${user.userName}/following/users"/>
<#else>
<p class="ft-center ft-gray home-invisible">${setinvisibleLabel}</p>
</#if>
</@home>